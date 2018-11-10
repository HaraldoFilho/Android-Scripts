#!/usr/bin/perl

#
#  File          : copyCommonFiles.pl
#  Last modified : 09/11/18 23:21 PM
#
#  Developer     : Haraldo Albergaria Filho, a.k.a. mohb apps
#
#  Description   : Script to copy to project area the files
#                  that are common to all projects
#  Usage         : copyCommonFiles.pl <project>
#
#  --------------------------------------------------------------


my $project             = $ARGV[0];
my $project_lc          = lc $project;

my $home_dir            = $ENV{'HOME'};

my $originPath          = $home_dir."/CommonFiles/AndroidStudioProjects/Project";
my $destinationPath     = $home_dir."/AndroidStudioProjects/$project";

my $javaOriginPath      = $originPath."/app/src/main/java/com/apps/mohb/project";
my $javaDestinationPath = $destinationPath."/app/src/main/java/com/apps/mohb/".$project_lc;

my $resOriginPath       = $originPath."/app/src/main/res";
my $resDestinationPath  = $destinationPath."/app/src/main/res";

my $file_manifest       = $destinationPath."/app/src/main/AndroidManifest.xml";
my $file_java_about     = $javaDestinationPath."/AboutActivity.java";
my $file_java_constants = $javaDestinationPath."/Constants.java";
my $file_java_feedback  = $javaDestinationPath."/FeedbackActivity.java";
my $file_java_help      = $javaDestinationPath."/HelpActivity.java";
my $file_java_splash    = $javaDestinationPath."/SplashActivity.java";
my $file_java_toasts    = $javaDestinationPath."/Toasts.java";
my $file_java_material  = $javaDestinationPath."/fragments/dialogs/MaterialIconsDialogFragment.java";
my $file_java_privacy   = $javaDestinationPath."/fragments/dialogs/PrivacyPolicyDialogFragment.java";
my $file_java_terms     = $javaDestinationPath."/fragments/dialogs/TermsOfUseDialogFragment.java";
my $file_res_strings    = $resDestinationPath."/values/strings.xml";
my $file_res_html       = $resDestinationPath."/values/html_strings.xml";
my $file_res_strings_pt = $resDestinationPath."/values-pt/strings.xml";
my $file_res_html_pt    = $resDestinationPath."/values-pt/html_strings.xml";
my $file_res_about      = $resDestinationPath."/layout/activity_about.xml";
my $file_res_about_h1   = $resDestinationPath."/layout-h1000dp/activity_about.xml";
my $file_res_about_h6   = $resDestinationPath."/layout-h600dp/activity_about.xml";
my $file_res_about_h8   = $resDestinationPath."/layout-h820dp/activity_about.xml";


###### COPY COMMON FILES TO PROJECT DIRECTORIES ########################################################

system "cp $originPath/app/src/main/AndroidManifest.xml $destinationPath/app/src/main/";
system "cp -r $javaOriginPath/* $javaDestinationPath";
system "cp $resOriginPath/values/* $resDestinationPath/values/";
system "cp -r $resOriginPath/values-pt $resDestinationPath";
system "cp $resOriginPath/values-v21/* $resDestinationPath/values-v21/";
system "cp $resOriginPath/drawable/* $resDestinationPath/drawable/";
system "cp -r $resOriginPath/drawable-hdpi $resDestinationPath";
system "cp -r $resOriginPath/drawable-mdpi $resDestinationPath";
system "cp -r $resOriginPath/drawable-xhdpi $resDestinationPath";
system "cp -r $resOriginPath/drawable-xxhdpi $resDestinationPath";
system "cp -r $resOriginPath/drawable-xxxhdpi $resDestinationPath";
system "cp $resOriginPath/menu/* $resDestinationPath/menu/";
system "cp $resOriginPath/layout/* $resDestinationPath/layout/";
system "cp -r $resOriginPath/layout-h1000dp $resDestinationPath";
system "cp -r $resOriginPath/layout-h600dp $resDestinationPath";
system "cp -r $resOriginPath/layout-h820dp $resDestinationPath";


###### READ DATA FROM FILES ########################################################################################

# Open files for reading
open FILE_MANIFEST, "$file_manifest" or die "Can't open $file_manifest to read: $!\n";
open FILE_JAVA_ABOUT, "$file_java_about" or die "Can't open $file_java_about to read: $!\n";
open FILE_JAVA_CONSTANTS, "$file_java_constants" or die "Can't open $file_java_constants to read: $!\n";
open FILE_JAVA_FEEDBACK, "$file_java_feedback" or die "Can't open $file_java_feedback to read: $!\n";
open FILE_JAVA_HELP, "$file_java_help" or die "Can't open $file_java_help to read: $!\n";
open FILE_JAVA_SPLASH, "$file_java_splash" or die "Can't open $file_java_splash to read: $!\n";
open FILE_JAVA_TOASTS, "$file_java_toasts" or die "Can't open $file_java_toasts to read: $!\n";
open FILE_JAVA_MATERIAL, "$file_java_material" or die "Can't open $file_java_material to read: $!\n";
open FILE_JAVA_PRIVACY, "$file_java_privacy" or die "Can't open $file_java_privacy to read: $!\n";
open FILE_JAVA_TERMS, "$file_java_terms" or die "Can't open $file_java_terms to read: $!\n";
open FILE_RES_STRINGS, "$file_res_strings" or die "Can't open $file_res_strings to read: $!\n";
open FILE_RES_HTML, "$file_res_html" or die "Can't open $file_res_html to read: $!\n";
open FILE_RES_STRINGS_PT, "$file_res_strings_pt" or die "Can't open $file_res_strings_pt to read: $!\n";
open FILE_RES_HTML_PT, "$file_res_html_pt" or die "Can't open $file_res_html_pt to read: $!\n";
open FILE_RES_ABOUT, "$file_res_about" or die "Can't open $file_res_about to read: $!\n";
open FILE_RES_ABOUT_H1, "$file_res_about_h1" or die "Can't open $file_res_about_h1 to read: $!\n";
open FILE_RES_ABOUT_H6, "$file_res_about_h6" or die "Can't open $file_res_about_h6 to read: $!\n";
open FILE_RES_ABOUT_H8, "$file_res_about_h8" or die "Can't open $file_res_about_h8 to read: $!\n";

# Read files
my @file_lines_manifest = <FILE_MANIFEST>;
my @file_lines_java_about = <FILE_JAVA_ABOUT>;
my @file_lines_java_constants = <FILE_JAVA_CONSTANTS>;
my @file_lines_java_feedback = <FILE_JAVA_FEEDBACK>;
my @file_lines_java_help = <FILE_JAVA_HELP>;
my @file_lines_java_splash = <FILE_JAVA_SPLASH>;
my @file_lines_java_toasts = <FILE_JAVA_TOASTS>;
my @file_lines_java_material = <FILE_JAVA_MATERIAL>;
my @file_lines_java_privacy = <FILE_JAVA_PRIVACY>;
my @file_lines_java_terms = <FILE_JAVA_TERMS>;
my @file_lines_res_strings = <FILE_RES_STRINGS>;
my @file_lines_res_html = <FILE_RES_HTML>;
my @file_lines_res_strings_pt = <FILE_RES_STRINGS_PT>;
my @file_lines_res_html_pt = <FILE_RES_HTML_PT>;
my @file_lines_res_about = <FILE_RES_ABOUT>;
my @file_lines_res_about_h1 = <FILE_RES_ABOUT_H1>;
my @file_lines_res_about_h6 = <FILE_RES_ABOUT_H6>;
my @file_lines_res_about_h8 = <FILE_RES_ABOUT_H8>;

# Close files
close FILE_MANIFEST;
close FILE_JAVA_ABOUT;
close FILE_JAVA_CONSTANTS;
close FILE_JAVA_FEEDBACK;
close FILE_JAVA_HELP;
close FILE_JAVA_SPLASH;
close FILE_JAVA_TOASTS;
close FILE_JAVA_MATERIAL;
close FILE_JAVA_PRIVACY;
close FILE_JAVA_TERMS;
close FILE_RES_STRINGS;
close FILE_RES_HTML;
close FILE_RES_STRINGS_PT;
close FILE_RES_HTML_PT;
close FILE_RES_HTML_ABOUT;
close FILE_RES_HTML_ABOUT_H1;
close FILE_RES_HTML_ABOUT_H6;
close FILE_RES_HTML_ABOUT_H8;


###### UPDATE DATA #################################################################################################

# Search for and update
foreach(@file_lines_manifest) {
	$_ =~ s/project/$project_lc/;
	$_ =~ s/Project/$project/;
}
foreach(@file_lines_java_about) {
	$_ =~ s/project/$project_lc/;
	$_ =~ s/Project/$project/;
}
foreach(@file_lines_java_constants) {
	$_ =~ s/project/$project_lc/;
	$_ =~ s/Project/$project/;
}
foreach(@file_lines_java_feedback) {
	$_ =~ s/project/$project_lc/;
	$_ =~ s/Project/$project/;
}
foreach(@file_lines_java_help) {
	$_ =~ s/project/$project_lc/;
	$_ =~ s/Project/$project/;
}
foreach(@file_lines_java_splash) {
	$_ =~ s/project/$project_lc/;
	$_ =~ s/Project/$project/;
}
foreach(@file_lines_java_toasts) {
	$_ =~ s/project/$project_lc/;
	$_ =~ s/Project/$project/;
}
foreach(@file_lines_java_material) {
	$_ =~ s/project/$project_lc/;
	$_ =~ s/Project/$project/;
}
foreach(@file_lines_java_privacy) {
	$_ =~ s/project/$project_lc/;
	$_ =~ s/Project/$project/;
}
foreach(@file_lines_java_terms) {
	$_ =~ s/project/$project_lc/;
	$_ =~ s/Project/$project/;
}
foreach(@file_lines_res_strings) {
	$_ =~ s/project/$project_lc/;
	$_ =~ s/Project/$project/;
}
foreach(@file_lines_res_html) {
	$_ =~ s/project/$project_lc/;
	$_ =~ s/Project/$project/;
}
foreach(@file_lines_res_strings_pt) {
	$_ =~ s/projeto/$project_lc/;
	$_ =~ s/Projeto/$project/;
}
foreach(@file_lines_res_html_pt) {
	$_ =~ s/projeto/$project_lc/;
	$_ =~ s/Projeto/$project/;
}
foreach(@file_lines_res_about) {
	$_ =~ s/project/$project_lc/;
	$_ =~ s/Project/$project/;
}
foreach(@file_lines_res_about_h1) {
	$_ =~ s/project/$project_lc/;
	$_ =~ s/Project/$project/;
}
foreach(@file_lines_res_about_h6) {
	$_ =~ s/project/$project_lc/;
	$_ =~ s/Project/$project/;
}
foreach(@file_lines_res_about_h8) {
	$_ =~ s/project/$project_lc/;
	$_ =~ s/Project/$project/;
}


###### WRITE DATA TO FILES #########################################################################################

# Open files for writing
open FILE_MANIFEST, ">$file_manifest" or die "Can't open $file_manifest to write: $!\n";
open FILE_JAVA_ABOUT, ">$file_java_about" or die "Can't open $file_java_about to write: $!\n";
open FILE_JAVA_CONSTANTS, ">$file_java_constants" or die "Can't open $file_java_constants to write: $!\n";
open FILE_JAVA_FEEDBACK, ">$file_java_feedback" or die "Can't open $file_java_feedback to write: $!\n";
open FILE_JAVA_HELP, ">$file_java_help" or die "Can't open $file_java_help to write: $!\n";
open FILE_JAVA_SPLASH, ">$file_java_splash" or die "Can't open $file_java_splash to write: $!\n";
open FILE_JAVA_TOASTS, ">$file_java_toasts" or die "Can't open $file_java_toasts to write: $!\n";
open FILE_JAVA_MATERIAL, ">$file_java_material" or die "Can't open $file_java_material to write: $!\n";
open FILE_JAVA_PRIVACY, ">$file_java_privacy" or die "Can't open $file_java_privacy to write: $!\n";
open FILE_JAVA_TERMS, ">$file_java_terms" or die "Can't open $file_java_terms to write: $!\n";
open FILE_RES_STRINGS, ">$file_res_strings" or die "Can't open $file_res_strings to write: $!\n";
open FILE_RES_HTML, ">$file_res_html" or die "Can't open $file_res_html to write: $!\n";
open FILE_RES_STRINGS_PT, ">$file_res_strings_pt" or die "Can't open $file_res_strings_pt to write: $!\n";
open FILE_RES_HTML_PT, ">$file_res_html_pt" or die "Can't open $file_res_html_pt to write: $!\n";
open FILE_RES_ABOUT, ">$file_res_about" or die "Can't open $file_res_about to write: $!\n";
open FILE_RES_ABOUT_H1, ">$file_res_about_h1" or die "Can't open $file_res_about_h1 to write: $!\n";
open FILE_RES_ABOUT_H6, ">$file_res_about_h6" or die "Can't open $file_res_about_h6 to write: $!\n";
open FILE_RES_ABOUT_H8, ">$file_res_about_h8" or die "Can't open $file_res_about_h8 to write: $!\n";

# Write updated data to files
foreach(@file_lines_manifest) {
	print FILE_MANIFEST $_;
}
foreach(@file_lines_java_about) {
	print FILE_JAVA_ABOUT $_;
}
foreach(@file_lines_java_constants) {
	print FILE_JAVA_CONSTANTS $_;
}
foreach(@file_lines_java_feedback) {
	print FILE_JAVA_FEEDBACK $_;
}
foreach(@file_lines_java_help) {
	print FILE_JAVA_HELP $_;
}
foreach(@file_lines_java_splash) {
	print FILE_JAVA_SPLASH $_;
}
foreach(@file_lines_java_toasts) {
	print FILE_JAVA_TOASTS $_;
}
foreach(@file_lines_java_material) {
	print FILE_JAVA_MATERIAL $_;
}
foreach(@file_lines_java_privacy) {
	print FILE_JAVA_PRIVACY $_;
}
foreach(@file_lines_java_terms) {
	print FILE_JAVA_TERMS $_;
}
foreach(@file_lines_res_strings) {
	print FILE_RES_STRINGS $_;
}
foreach(@file_lines_res_html) {
	print FILE_RES_HTML $_;
}
foreach(@file_lines_res_strings_pt) {
	print FILE_RES_STRINGS_PT $_;
}
foreach(@file_lines_res_html_pt) {
	print FILE_RES_HTML_PT $_;
}
foreach(@file_lines_res_about) {
	print FILE_RES_ABOUT $_;
}
foreach(@file_lines_res_about_h1) {
	print FILE_RES_ABOUT_H1 $_;
}
foreach(@file_lines_res_about_h6) {
	print FILE_RES_ABOUT_H6 $_;
}
foreach(@file_lines_res_about_h8) {
	print FILE_RES_ABOUT_H8 $_;
}


# Close files
close FILE_MANIFEST;
close FILE_JAVA_ABOUT;
close FILE_JAVA_CONSTANTS;
close FILE_JAVA_FEEDBACK;
close FILE_JAVA_HELP;
close FILE_JAVA_SPLASH;
close FILE_JAVA_TOASTS;
close FILE_JAVA_MATERIAL;
close FILE_JAVA_PRIVACY;
close FILE_JAVA_TERMS;
close FILE_RES_STRINGS;
close FILE_RES_HTML;
close FILE_RES_STRINGS_PT;
close FILE_RES_HTML_PT;
close FILE_RES_HTML_ABOUT;
close FILE_RES_HTML_ABOUT_H1;
close FILE_RES_HTML_ABOUT_H6;
close FILE_RES_HTML_ABOUT_H8;


