#!/usr/bin/perl

my $project;
my $originPath;
my $mdFilesPath;
my $destinationPath;
my $gradle_file; 
my $commitMessage;
my $mdFilesPath;
my $destinationPath;
my $gradle_file;
my @gradle_file_lines;

$project      = $ARGV[0];
$include_test = $ARGV[1];

$destinationPath = "/home/mohb/GitHubReleases/$project";
$mdFilesPath = "/home/mohb/mdFiles/$project/";

if($include_test =~ /-t/) {
	$originPath = "/home/mohb/AndroidStudioProjects/$project/app/src/";
	system "rsync -rutv --force --exclude='debug' --exclude='release' --exclude='drawable*' --exclude='mipmap*' $originPath $destinationPath";
}    
else {
	$originPath = "/home/mohb/AndroidStudioProjects/$project/app/src/main/";
	system "rsync -rutv --force --exclude='drawable*' --exclude='mipmap*' $originPath $destinationPath";
}

system "rsync -rutv --force $mdFilesPath $destinationPath";

$gradle_file = "/home/mohb/AndroidStudioProjects/".$project."/app/build.gradle";

open GRADLE, "$gradle_file" or die "Can't open $gradle_file to read: $!\n";
@gradle_file_lines = <GRADLE>;
close GRADLE;

foreach(@gradle_file_lines) {
	$_ =~ /versionName\s\"(.+)\"/;
	$commitMessage = $1;
}

chdir $destinationPath;
system "git add *";
system "git commit -m $commitMessage";
system "git push -u origin master";



