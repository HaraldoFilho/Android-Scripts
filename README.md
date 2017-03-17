# Scripts

These scripts are used to automate Android development tasks

### gitHubRelease.pl

Used to upload app releases to GitHub. Only the source code is uploaded (drawables, mipmaps and xml files containing API keys are excluded). Additionaly, there is an option to upload the test codes together with the main application code.

### updateProjectVersion.pl

Used to update the application versions (versionCode and versionName) prior to releases. The build.gradle and strings.xml files are automatically updated, avoiding mismatches between them.

