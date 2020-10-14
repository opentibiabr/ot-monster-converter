using System;
using Xunit;
using System.IO;
using System.Collections.Generic;
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
            // Monsters that are heavily edited on revsys already or simply don't make sense right now
            List<string> ignoredMonsters = new List<String>() {
                "Faun",
                "Dark Faun",
                "Pixie",
                "Scar Tribe Warrior",
                "Renegade Knight",
                "Priestess", // Wrong loot
                "Marid" // Wrong loot
                // Check xml ripper spectre 
            };
            
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
                    if (ignoredMonsters.Contains(monster.Name)) {
                        continue;
                    }

                    if (!Directory.Exists(actualDestination))
                    {
                        Directory.CreateDirectory(actualDestination);
                    }
                    _tfsRevScriptSysConverter.WriteMonster(actualDestination, ref monster);
                    Console.WriteLine("Checking from XML to RevScriptSys: " + monster.Name + " on filename " + monster.FileName);

                    Assert.Equal(File.ReadAllText(Path.Combine(expectedRevSysDestination, monster.FileName + ".lua")),File.ReadAllText(Path.Combine(actualDestination, monster.FileName + ".lua")));
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
