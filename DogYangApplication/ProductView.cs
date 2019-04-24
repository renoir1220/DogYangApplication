using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;
using DevExpress.XtraEditors;
using System.ComponentModel.DataAnnotations;
using System.IO;
using DevExpress.XtraLayout.Helpers;
using DevExpress.XtraLayout;

namespace DogYangApplication
{
    public partial class ProductView : DevExpress.XtraBars.Ribbon.RibbonForm
    {
        ModelContainer model = new ModelContainer();
        public Product Product { get; set; }

        public ProductView()
        {
            InitializeComponent();
        }

        private void ProductView_Load(object sender, EventArgs e)
        {
            if (Product == null)
            {
                Product = new Product();
                model.ProductSet.Add(Product);
            }
            productBindingSource.DataSource = Product;

        }

        private void bbiUpPic_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            OpenFileDialog dialog = new OpenFileDialog();
            var r = dialog.ShowDialog();
            if (r != DialogResult.OK)
                return;

            Image img = Image.FromFile(dialog.FileName);

            pictureEdit1.Image = img;
            Product.Picture = File.ReadAllBytes(dialog.FileName);            
        }

        private void bbiSave_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            model.SaveChanges();
        }

        private void mainRibbonControl_Click(object sender, EventArgs e)
        {

        }

        private void bbiSaveAndClose_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            model.SaveChanges();
            DialogResult = DialogResult.OK;
            Close();
        }
    }
}
