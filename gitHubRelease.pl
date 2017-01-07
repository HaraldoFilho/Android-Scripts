#!/usr/bin/perl

#
#  File          : gitHubRelease.pl
#  Last modified : 01/06/17 8:31 PM
#
#  Developer     : Haraldo Albergaria Filho, a.k.a. mohb apps
#
#  Description   : Script to upload code of releases to GitHub
#  Usage         : gitHubRelease.pl <project> [-t]
#
#  --------------------------------------------------------------


my $project          = $ARGV[0];
my $include_test     = $ARGV[1];

my $home_dir         = $ENV{'HOME'};

my $destinationPath  = $home_dir."/GitHubReleases/$project";
my $mdFilesPath      = $home_dir."/mdFiles/$project/";

my $gradle_file      = $home_dir."/AndroidStudioProjects/".$project."/app/build.gradle";


###### COPY PROJECT FILES TO LOCAL GIT REPOSITORY ########################################################

# Check if destination directory already exists
if (not -e $destinationPath) {
	# Create destination directory
	!system "mkdir $destinationPath" or die "\nCan't create directory $destinationPath\n\n";
}

# If there is no second argument, copy only main application source files
if(!$include_test) {
	$originPath = $home_dir."/AndroidStudioProjects/$project/app/src/main/";
	system "rsync -rutv --force --exclude='drawable*' --exclude='mipmap*' $originPath $destinationPath";
}    
else {
	# If second argument is "-t", copy all source files, including tests 
	if($include_test =~ /-t/) {
		$originPath = $home_dir."/AndroidStudioProjects/$project/app/src/";
		system "rsync -rutv --force --exclude='debug' --exclude='release' --exclude='drawable*' --exclude='mipmap*' $originPath $destinationPath";
	}
	else { # display message of invalid option
		die "Invalid option: $include_test\n";
	}
}

# Check if there are markdown files
if(-s $mdFilesPath) {
	# Copy markdown files
	system "rsync -rutv --force $mdFilesPath $destinationPath";
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

#chdir $destinationPath;
#system "git add *";
#system "git commit -m $commitMessage";
#system "git push -u origin master";


