using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CuteCat
{
    public class Cat
    {
        public string Name;
        public int Age;

        private int Happiness= 50;

        public Cat(string Name, int Age)
        {
            this.Name = Name;
            this.Age = Age;
        }
        public void Play()
        {
            Happiness += 10;
            FeelCheck();
        }

        public void Eat()
        {
            Happiness += 20;
            FeelCheck();
        }

        public string Express()
        {
            string message = "";
            if(Happiness>=80)
            {
                message = "I'm very happy";
            }
            else if(Happiness>=60)
            {
                message = "I'm happy";
            }
            else if (Happiness >=40)
            {
                message = "I'm so so";
            }
            else if (Happiness >=20)
            {
                message = "I'm gloomy";
            }
            else
            {
                message = "I'm sad";
            }
            return this.Name + ": " + message;
        }

        public void getBored()
        {
            Happiness -= 10;
            FeelCheck();
        }

        private void FeelCheck()
        {
            if(Happiness>100)
            {
                Happiness = 100;
            }

            if(Happiness<0)
            {
                Happiness = 0;
            }
        }
    }
}
