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
            // TODO
            // Monsters without melee can attack
            // Attacks without target (which ignores ANIM and looks like attacks from nowhere)
            // Conditions are going as combat? (because of that curse and drown are broken)
            // flag isPet
            // flag passive
            // Check speed spells
            // Check outfit spells

            // Monsters that are heavily edited on revsys already or simply don't make sense right now
            List<string> ignoredMonsters = new List<String>() {
                "Faun",
                "Dark Faun",
                "Pixie",
                "Scar Tribe Warrior",
                "Renegade Knight",
                "Priestess", // Wrong loot
                "Marid", // Wrong loot
                "Madareth", // Wrong loot
                "Overcharged Energy Elemental", // Wrong loot
                "Shard Of Magnor", // Wrong ... ????
                // Check xml ripper spectre ,
                "Deathling Spellsinger", //voices need escaping
                "Deathling Scout", // wrong outfit?
                "Energized Raging Mage", // no idea what's going on on this one
                "Bragrumol", // wrong loot
                "Count Vlarkorth", // weird voices 
                "Earl Osam", // weird voices 
                "Sir Nictros", // missing creature script, incomplete?
                "Grand Master Oberon" // probably not worth automating :)
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

                    string expected = File.ReadAllText(Path.Combine(expectedRevSysDestination, monster.FileName + ".lua"));
                    string actual = File.ReadAllText(Path.Combine(actualDestination, monster.FileName + ".lua"));

                    if (!expected.Equals(actual)) {
                        Console.WriteLine(actual);
                        Console.WriteLine("Checked from XML to RevScriptSys: " + monster.Name + " on filename " + Path.Combine(expectedRevSysDestination, monster.FileName));
                    } else {
                        Console.WriteLine("Checked from XML to RevScriptSys: " + monster.Name);
                    }
                    

                    Assert.Equal(expected, actual);
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
