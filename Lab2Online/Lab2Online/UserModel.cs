using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Lab2Online
{
    public class UserModel
    {
        private string emri;
        private string mbiemri;
        private string gjinia;
        private string diteleindja;
        public static int numri_leternjoftimit;
        public static int numri_personal;
        private string adresa;
        public static string vendi;
        public static string komuna;


        public string Emri { get { return emri; } set { emri = value; } }
        public string Mbiemri { get { return mbiemri; } set { mbiemri = value; } }
        public string Gjinia { get { return gjinia; } set { gjinia = value; } }
        public string Diteleindja { get { return diteleindja; } set { diteleindja = value; } }
        public int Numri_leternjoftimit { get { return numri_leternjoftimit; } set { numri_leternjoftimit = value; } }
        public int Numri_personal { get { return numri_personal; } set { numri_personal = value; } }
        public string Adresa { get { return adresa; } set { adresa = value; } }
        public string Vendi { get { return vendi; } set { vendi = value; } }
        public string Komuna { get { return komuna; } set { komuna = value; } }
    }
}