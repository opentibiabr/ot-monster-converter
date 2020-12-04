using System;
using System.Collections.Generic;
using System.Text;
using System.Windows;

namespace OTMonsterConverter
{
    class Program
    {
        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        static int Main(string[] args)
        {
            FreeConsole(); // detach console
            Application app = new Application();
            app.Run(new MainWindow());
            return 0;
        }

        [System.Runtime.InteropServices.DllImport("kernel32.dll", SetLastError = true)]
        private static extern bool FreeConsole();
    }
}
