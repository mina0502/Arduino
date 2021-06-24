using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AnimalShelter
{
    public enum DogBreed { Mixed, Bulldog, Jindo, Yorkshire }

    public class Dog : Pet
    {
        public DogBreed Breed;

        public Dog(int PetId, String Name, string Color, string Gender, DogBreed Breed) : base(PetId,Name,Color,Gender)
        {
            this.Breed = Breed;
        }

        public override string MakeSound()
        {
            return "멍멍";
        }

        public string Bite()
        {
            return "물기";
        }
    }
}
