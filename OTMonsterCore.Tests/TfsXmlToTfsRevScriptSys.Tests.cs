using System;
using Xunit;
using System.IO;
using OTMonsterCore.Converter;
using OTMonsterCore.MonsterTypes;

namespace Converter.Tests
{
    public class TfsXmlToTfsRevScriptSys
    {
        private readonly TfsRevScriptSysConverter _tfsRevScriptSysConverter;
        private readonly TfsXmlConverter _tfsXmlConverter;

        public TfsXmlToTfsRevScriptSys() {
            _tfsRevScriptSysConverter = new TfsRevScriptSysConverter();
            _tfsXmlConverter = new TfsXmlConverter();
        }

        [Fact]
        public void MakeSureConversionIsCorrect()
        {
            string tfsXmlDir = Path.Combine(System.AppDomain.CurrentDomain.BaseDirectory, "..", "..", "..", "TfsXmls");
            string actualDir = Path.Combine(System.AppDomain.CurrentDomain.BaseDirectory, "..", "..", "..", "ActualTfsRevScriptSys");
            string expectedDir = Path.Combine(System.AppDomain.CurrentDomain.BaseDirectory, "..", "..", "..", "ExpectedTfsRevScriptSys");

            string[] files = Directory.GetFiles(tfsXmlDir, "*.xml", SearchOption.AllDirectories);
  
            string actualDestination, expectedRevSysDestination;
            foreach (string file in files)
            {
                actualDestination = Path.Combine(actualDir, FindExactFileDestination(tfsXmlDir, file));
                expectedRevSysDestination = Path.Combine(expectedDir, FindExactFileDestination(tfsXmlDir, file));

                if (_tfsXmlConverter.ReadMonster(file, out Monster monster))
                {
                    if (!Directory.Exists(actualDestination))
                    {
                        Directory.CreateDirectory(actualDestination);
                    }
                    _tfsRevScriptSysConverter.WriteMonster(actualDestination, ref monster);
                    Console.WriteLine("Checking from XML to RevScriptSys: " + monster.Name);

                    Assert.Equal(File.ReadAllText(Path.Combine(actualDestination, monster.FileName + ".lua")), File.ReadAllText(Path.Combine(expectedRevSysDestination, monster.FileName + ".lua")));
                }
            }
        }

        static string FindExactFileDestination(string inputDirectory, string file)
        {
            string nameOnly = Path.GetFileName(file);
            string subPath = file.Replace(nameOnly, "");
            subPath = subPath.Replace(inputDirectory, "");
            subPath = subPath.Substring(1, subPath.Length - 1);
            return subPath;
        }
    }
}
