#!/usr/bin/perl

#
#  File          : gitHubRelease.pl
#  Last modified : 07/09/17 8:51 PM
#
#  Developer     : Haraldo Albergaria Filho, a.k.a. mohb apps
#
#  Description   : Script to upload code of releases to GitHub
#  Usage         : gitHubRelease.pl <project>
#
#  --------------------------------------------------------------


my $project          = $ARGV[0];

my $home_dir         = $ENV{'HOME'};

my $originPath       = $home_dir."/AndroidStudioProjects/$project/";
my $destinationPath  = $home_dir."/GitHubReleases/$project";
my $mdFilesPath      = $home_dir."/mdFiles/$project";

my $gradle_file      = $home_dir."/AndroidStudioProjects/".$project."/app/build.gradle";


###### COPY PROJECT FILES TO LOCAL GIT REPOSITORY ########################################################

# Check if destination directory already exists
if (not -e $destinationPath) {
	# Create destination directory
	!system "mkdir $destinationPath" or die "\nCan't create directory $destinationPath\n\n";
	chdir $destinationPath;
	system "git init";
}
else { # Remove all files on destination path
	system "rm -fr $destinationPath/*";
	chdir $destinationPath;
	system "git rm -r *"
}

# Copy project files
system "rsync -rutv --del --force --exclude='.git' --exclude='.aab' --exclude='.apk' --exclude='debug' --exclude='release' --exclude='build' $originPath $destinationPath";

# Check if there are markdown files
if(-s $mdFilesPath) {
	# Copy markdown files
	system "cp $mdFilesPath/* $destinationPath";
}

###### GET VERSION NAME FROM GRADLE BUILD FILE ############################################################

# Read file
open GRADLE, "$gradle_file" or die "Can't open $gradle_file to read: $!\n";
my @gradle_file_lines = <GRADLE>;
close GRADLE;

# Search for versionName and set it as the commit message
my $commitMessage;
foreach(@gradle_file_lines) {
	$_ =~ /versionName\s\"(.+)\"/;
	$commitMessage = $1;
}


###### COMMIT FILES AND PUSH THEM TO REMOTE REPOSITORY ####################################################

chdir $destinationPath;
system "git add -f *";
system "git add .gitignore";
system "git add .idea";
system "git commit -m $commitMessage";
system "git push -u origin master";
system "git push fork master"; # Updates the fork repository (comment or remove if not necessary)
if ($project eq "ShutterNotes") {
    system "git push photo master"; # Updates the 'photo' repository (comment or remove if not necessary)
}
