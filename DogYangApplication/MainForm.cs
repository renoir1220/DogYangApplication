using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Text;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;
using DevExpress.XtraEditors;

namespace DogYangApplication
{
    public partial class MainForm : DevExpress.XtraBars.Ribbon.RibbonForm
    {
        public List<Product> Products = new List<Product>();
        ModelContainer model = new ModelContainer();

        public MainForm()
        {
            InitializeComponent();
            this.AllowDrop = true;
            this.DragEnter += new DragEventHandler(Form1_DragEnter);
            this.DragDrop += new DragEventHandler(Form1_DragDrop);
        }


        private void MainForm_Load(object sender, EventArgs e)
        {
            Products = model.ProductSet.ToList();
            productBindingSource.DataSource = Products;
        }

        void navBarControl_ActiveGroupChanged(object sender, DevExpress.XtraNavBar.NavBarGroupEventArgs e)
        {
            navigationFrame.SelectedPageIndex = navBarControl.Groups.IndexOf(e.Group);
        }

        private void bbiAddProduct_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            ProductView f = new ProductView();
            var r = f.ShowDialog();
            if (r != DialogResult.OK)
                return;
            Products.Add(f.Product);
            productGridControl.RefreshDataSource();
        }

        /// <summary>
        /// 拖拽图片直接加入到作品
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void productGridControl_DragDrop(object sender, DragEventArgs e)
        {
            var data = e.Data;
        }



        void Form1_DragEnter(object sender, DragEventArgs e)
        {
            if (e.Data.GetDataPresent(DataFormats.FileDrop)) e.Effect = DragDropEffects.Copy;
        }

        void Form1_DragDrop(object sender, DragEventArgs e)
        {
            string[] files = (string[])e.Data.GetData(DataFormats.FileDrop);
            foreach (string file in files)
            {
                FileInfo fInfo =new FileInfo(file);
                var p =new Product();
                p.Name = fInfo.Name;
                p.Picture = File.ReadAllBytes(file);
                model.ProductSet.Add(p);
                Products.Add(p);
            }

            model.SaveChanges();
            productGridControl.RefreshDataSource();
        }
    }
}