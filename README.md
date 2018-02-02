# Scripts

These scripts are used to automate Android development tasks

### [updateProjectVersion.pl](https://github.com/mohb-apps/Scripts/blob/master/updateProjectVersion.pl)

Used to update the application versions (versionCode and versionName) prior to releases. The build.gradle and strings.xml files are automatically updated, avoiding mismatches between them.

### [gitHubRelease.pl](https://github.com/mohb-apps/Scripts/blob/master/gitHubRelease.pl)

Used to upload app releases to GitHub. It copies all the project files from _AndroidStudioProjects_ directory, excluding API string files, commits the changes and upload them to GitHub.
