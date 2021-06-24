using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Collections;

namespace AnimalShelter
{
    public partial class Form1 : Form
    {
        /*
        public Customer[] CustomerArray = new Customer[10];
        public int CustomerArrayIndex = 0;
        */

        public List<Customer> Customers = new List<Customer>();
        public Form1()
        {
            InitializeComponent();
            CusFullName.Text = "";
            CusAge.Text = "";
            CusAddress.Text = "";
            cusDescription.Text = "";
            CusIsQualified.Text = "";
            CusPetInfo.Text = "";
        }

        private void CreateCustomer_Click(object sender, EventArgs e)
        {

            Customer cus =new Customer(CusNewFirstName.Text,CusNewLastName.Text,DateTime.Parse(CusNewAge.Text));
          
            cus.Address = CusNewAddress.Text;
            cus.Description = CusNewDescription.Text;
            CusList.Rows.Add(cus.FirstName, cus.Age, cus.IsQualified);
            Customers.Add(cus);
   
        }

        public void ShowDetails(Customer cus)
        {
            CusFullName.Text = cus.FullName;
            CusAge.Text = cus.Age.ToString();
            CusAddress.Text = cus.Address;
            cusDescription.Text = cus.Description;
            if (cus.IsQualified)
            {
                CusIsQualified.Text = "가능";
            }
            else
            {
                CusIsQualified.Text = "불가능";
            }
            CusPetInfo.Text = "";
            foreach(Cat cat in cus.MyCats)
            {
                CusPetInfo.Text += cat.Name + ": " + cat.MakeSound() + Environment.NewLine;
            }
            foreach(Dog dog in cus.MyDogs)
            {
                CusPetInfo.Text += dog.Name + ": " + dog.MakeSound() + Environment.NewLine;
            }

        }

        private void CusList_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            string firstName = CusList.Rows[e.RowIndex].Cells[0].Value.ToString();

            foreach(Customer cus in Customers)
            {
                if(cus.FirstName== firstName)
                {
                    ShowDetails(cus);
                    break;
                }
            }
            CusDetailPanel.Show();
            CusNewPanel.Hide();
        } 

        private void Form1_Load(object sender, EventArgs e)
        {
            CusListPanel.Dock = DockStyle.Fill;
            CusDetailPanel.Dock = DockStyle.Right;
            CusNewPanel.Dock = DockStyle.Right;


            Customer cus = new Customer("Ian", "Na", new DateTime(2000, 1, 1));
            Cat cat = new Cat(1,"Lucas","White","Male");
            cus.Adopt(cat);
            Cat cat2 = new Cat(3, "Ruby", "Brown", "Female");
            cus.Adopt(cat2);

            Dog dog = new Dog(2, "Happy", "Black", "Male",DogBreed.Jindo);
            cus.Adopt(dog);

            Customers.Add(cus);
            CusList.Rows.Add(cus.FirstName, cus.Age, cus.IsQualified);

            Pet pet;
            pet = dog;
            pet.MakeSound();

            pet = cat;
            pet.MakeSound();
        }

        private void toolStripMenuItem1_Click(object sender, EventArgs e)
        {
            CusNewPanel.Show();
            CusDetailPanel.Hide();
        }
     
    }
}
