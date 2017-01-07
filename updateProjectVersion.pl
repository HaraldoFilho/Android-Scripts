#!/usr/bin/perl

#
#  File          : updateProjectVersion.pl
#  Last modified : 01/06/17 11:31 PM
#
#  Developer     : Haraldo Albergaria Filho, a.k.a. mohb apps
#
#  Description   : Script to update app release versions
#  Usage         : updateProjectVersion.pl <project> <versionCode> <versionName>
#
#  ---------------------------------------------------------------------------------

my $project       = $ARGV[0];
my $versionCode   = $ARGV[1];
my $versionName   = $ARGV[2];

my $home_dir      = $ENV{'HOME'};

my $gradle_file   = $home_dir."/AndroidStudioProjects/".$project."/app/build.gradle";
my $strings_file  = $home_dir."/AndroidStudioProjects/".$project."/app/src/main/res/values/strings.xml";


###### READ DATA FROM FILES ########################################################################################

# Open files for reading
open GRADLE, "$gradle_file" or die "Can't open $gradle_file to read: $!\n";
open STRINGS, "$strings_file" or die "Can't open $strings_file to read: $!\n";

# Read files
my @gradle_file_lines = <GRADLE>;
my @strings_file_lines = <STRINGS>;

# Close files
close GRADLE;
close STRINGS;


###### UPDATE DATA #################################################################################################

# Search for and update versionCode and versionName on build.gradle
foreach(@gradle_file_lines) {
	$_ =~ s/versionCode\s(\d+)/versionCode $versionCode/;
	$_ =~ s/versionName\s\"(.+)\"/versionName "$versionName"/;
}

# Search for and update versionCode and versionName on strings.xml
foreach(@strings_file_lines) {
	$_ =~ s/(\<string\sname=\"version_number\"\stranslatable=\"false\"\>)(.+)(\<\/string\>)/$1$versionName$3/;
	$_ =~ s/(\<string\sname=\"version_code\"\stranslatable=\"false\"\>)(.+)(\<\/string\>)/$1$versionCode$3/;
}


###### WRITE DATA TO FILES #########################################################################################

# Open files for writing
open GRADLE, ">$gradle_file" or die "Can't open $gradle_file to write: $!\n";
open STRINGS, ">$strings_file" or die "Can't open $strings_file to write: $!\n";

# Write updated data to build.gradle
foreach(@gradle_file_lines) {
	print GRADLE $_;
}

# Write updated data to strings.xml
foreach(@strings_file_lines) {
	print STRINGS $_;
}

# Close files
close GRADLE;
close STRINGS;


