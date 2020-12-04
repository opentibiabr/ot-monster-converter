This directory is our source of truth. 
If you need to fix broken monsters from Revsys, follow the steps:

- Fix the lua manually on this folder
- After fixing, run the tests
- The test will fail because the converter generated the old broken lua
- Make the changes to the converter, so we will have good output for every monster that has the issue 
- Override the good output (you have just fixed) of the converter for every other monster
- Finally, when the tests for other monsters than the one you started fixing are good, take these monsters and PR the changes back to the otservbr-global repo :)