using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AnimalShelter
{
    public class Customer
    {
        public string FirstName;
        public string LastName;
        private DateTime _Birthday;
        private bool _IsQalified;
        public string Address;
        public string Description;


        private List<Pet> _MyPets = new List<Pet>();
        public List<Pet> MyPets
        {
            get { return _MyPets; }
        }

        public bool Adopt(Pet pet)
        {
            if(_IsQalified)
            {
                _MyPets.Add(pet);
                return true;
            }
            else
            {
                return false;
            }
        }


        private List<Cat> _MyCats = new List<Cat>();
        public List<Cat> MyCats
        {
            get { return _MyCats; }
        }
        public bool Adopt(Cat cat)
        {
            if (_IsQalified)
            {
                _MyCats.Add(cat);
                return true;
            }
            else
            {
                return false;
            }
        }

        private List<Dog> _MyDogs = new List<Dog>();
        public List<Dog> MyDogs
        {
            get { return _MyDogs; }
        }
        public bool Adopt(Dog dog)
        {
            if (_IsQalified)
            {
                _MyDogs.Add(dog);
                return true;
            }
            else
            {
                return false;
            }
        }

        public Customer(string FirstName, string LastName, DateTime birthday)
        {
            this.FirstName = FirstName;
            this.LastName = LastName;
            this._Birthday = birthday;
            this._IsQalified = Age>=18;

        }

    public int Age
        {
            get
            {
                return DateTime.Now.Year - _Birthday.Year +1;
            }
        }
    public DateTime Birthday
        {
        get
            {
                return _Birthday;
            }
        set
            {
                _Birthday = value;
                _IsQalified = Age >= 18;
            }
        }
      
        public bool IsQualified
        {
            get
            {
                return _IsQalified;
            }
        }
    public string FullName
        {
            get
            {
                return FirstName + " " + LastName;
            }
        }
    }
}
