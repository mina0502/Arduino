using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AnimalShelter
{
    public class Cat : Pet
    {
        public Cat(int PetId,String Name, string Color, string Gender):base(PetId,Name,Color,Gender)
        {
        }
         
        public override string MakeSound()
        {
            return "야옹";
        }

        public string Scratch()
        {
            return "할퀴기";
        }

    }
}
