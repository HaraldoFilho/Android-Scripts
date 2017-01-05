#!/usr/bin/perl

my $project      = $ARGV[0];
my $versionCode  = $ARGV[1];
my $versionName  = $ARGV[2];

my $gradle_file  = "/home/mohb/AndroidStudioProjects/".$project."/app/build.gradle";
my $strings_file = "/home/mohb/AndroidStudioProjects/".$project."/app/src/main/res/values/strings.xml";

open GRADLE, "$gradle_file" or die "Can't open $gradle_file to read: $!\n";
open STRINGS, "$strings_file" or die "Can't open $strings_file to read: $!\n";

my @gradle_file_lines = <GRADLE>;
my @strings_file_lines = <STRINGS>;

close GRADLE;
close STRINGS;

foreach(@gradle_file_lines) {
	$_ =~ s/versionCode\s(\d+)/versionCode $versionCode/;
	$_ =~ s/versionName\s\"(.+)\"/versionName "$versionName"/;
}

foreach(@strings_file_lines) {
	$_ =~ s/(\<string\sname=\"version_number\"\stranslatable=\"false\"\>)(.+)(\<\/string\>)/$1$versionName$3/;
	$_ =~ s/(\<string\sname=\"version_code\"\stranslatable=\"false\"\>)(.+)(\<\/string\>)/$1$versionCode$3/;
}

open GRADLE, ">$gradle_file" or die "Can't open $gradle_file to write: $!\n";
open STRINGS, ">$strings_file" or die "Can't open $strings_file to write: $!\n";

foreach(@gradle_file_lines) {
	print GRADLE $_;
}

foreach(@strings_file_lines) {
	print STRINGS $_;
}

close GRADLE;
close STRINGS;



