using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace HelloCSharpWin
{

    public partial class Calculator : Form
    {
        public int Result = 0, temp = 0;
        public bool isNewNum = true, isFirst = true;
        public enum Operators {Add,Sub,Multi,Div}
        public Operators Opt;

        public Calculator()
        {
            InitializeComponent();
        }



        public int Add(int number1, int number2){

            int sum= number1+number2;
            return sum;
        }

        public int Sub(int number1, int number2)
        {
            int sub = number1 - number2;
            return sub;
        }

        public int Multi(int number1, int number2)
        {
            int mul = number1 * number2;
            return mul;
        }

        public int Div(int number1, int number2)
        {
            int div = number1 / number2;
            return div;
        }


        private void NumButton0_Click(object sender, EventArgs e)
        {
            SetNum("0");
        }
        private void NumButton1_Click(object sender, EventArgs e)
        {
 
            SetNum("1");
        }

        private void NumButton2_Click(object sender, EventArgs e)
        {
       
            SetNum("2");
        }

        private void NumButton3_Click(object sender, EventArgs e)
        {
            SetNum("3");
        }

        private void NumButton4_Click(object sender, EventArgs e)
        {
            SetNum("4");
        }
        private void NumButton5_Click(object sender, EventArgs e)
        {
            SetNum("5");
        }
        private void NumButton6_Click(object sender, EventArgs e)
        {
            SetNum("6");
        }
        private void NumButton7_Click(object sender, EventArgs e)
        {
            SetNum("7");
        }
        private void NumButton8_Click(object sender, EventArgs e)
        {
            SetNum("8");
        }
        private void NumButton9_Click(object sender, EventArgs e)
        {
            SetNum("9");
        }

        public void SetNum(string num)
        {
          
            if (isNewNum)
            {
                NumScreen.Text = num;
                isNewNum = false;
            }
             else if (NumScreen.Text == "0")
                {
                    NumScreen.Text = num;
                }
                else
                {
                    NumScreen.Text += num;
                }
            }

        private void NumPlus_Click(object sender, EventArgs e)
        {
            Button optButton = (Button)sender;
            if(optButton.Text=="+")
            {
                Opt = Operators.Add;
                if(isFirst)
                {
                    temp = int.Parse(NumScreen.Text);
                    NumScreen.Text = "0";
                    isFirst = false;
                }
                else
                {
                    if (isNewNum == false)
                    {
                        int num = Int32.Parse(NumScreen.Text);
                        Opt = Operators.Add;
                        NumScreen.Text = Result.ToString();
                        temp = Result;
                        isNewNum = true;
                    }
                }
            }
        }

        private void NumSub_Click(object sender, EventArgs e)
        {
            Button optButton = (Button)sender;
            if (optButton.Text == "-")
            {
                Opt = Operators.Sub;
                if (isFirst)
                {
                    temp = int.Parse(NumScreen.Text);
                    NumScreen.Text = "0";
                    isFirst = false;
                }
                else
                {
                    if (isNewNum == false)
                    {
                        int num = Int32.Parse(NumScreen.Text);
                        Opt = Operators.Add;
                        NumScreen.Text = Result.ToString();
                        temp = Result;
                        isNewNum = true;
                    }
                }
            }
        }

        private void NumDiv_Click(object sender, EventArgs e)
        {
            Button optButton = (Button)sender;

            if (optButton.Text == "/")
            {
                Opt = Operators.Div;
                if (isFirst)
                {
                    temp = int.Parse(NumScreen.Text);
                    NumScreen.Text = "0";
                    isFirst = false;
                }
                else
                {
                    if (isNewNum == false)
                    {
                        int num = Int32.Parse(NumScreen.Text);
                        Opt = Operators.Add;
                        NumScreen.Text = Result.ToString();
                        temp = Result;
                        isNewNum = true;
                    }
                }
            }
        }

        private void NumMul_Click(object sender, EventArgs e)
        {
            Button optButton = (Button)sender;
            if (optButton.Text == "*")
            {
                Opt = Operators.Multi;
                if (isFirst)
                {
                    temp = int.Parse(NumScreen.Text);
                    NumScreen.Text = "0";
                    isFirst = false;
                }
                else
                {
                    if (isNewNum == false)
                    {
                        int num = Int32.Parse(NumScreen.Text);
                        Opt = Operators.Add;
                        NumScreen.Text = Result.ToString();
                        temp = Result;
                        isNewNum = true;
                    }
                }
            }
        }

        private void ResultButton_Click(object sender, EventArgs e)
        {
            if(isNewNum==false)
            {
                if(Opt==Operators.Add)
                {
                 Result= Add(temp, int.Parse(NumScreen.Text));
                }
                else if(Opt==Operators.Sub)
                {
                    Result = Sub(temp, int.Parse(NumScreen.Text));
                }
                else if(Opt==Operators.Multi)
                {
                    Result = Multi(temp, int.Parse(NumScreen.Text));
                }
                else if(Opt==Operators.Div)
                {
                    Result = Div(temp, int.Parse(NumScreen.Text));
                }
                NumScreen.Text = Result.ToString();
                isNewNum = true;
                isFirst = true;
            }
        }

        private void reset_Click(object sender, EventArgs e)
        {
            NumScreen.Text = "0";
            temp = 0;
            isNewNum = true;
            isFirst = true;
        }

       

    }
}
