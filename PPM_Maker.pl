##  Copyright (c) 2013
##  Contributed by {Austin Dixon}  {04/12/2013}.
##  All rights reserved.
 
##  Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
 
##    * Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
##    * Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the
##       distribution.
##    * Neither the name of The University of Alabama Libraries nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
 
##THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
##THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
##CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
##PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
##LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
##EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


# must have ImageMagick installed on computer before running script
# script converts images to PPM P3 ACSII format and resizes to 60X60 pixels 
 
#! usr/local/bin/perl
use Tkx;
use LWP::Simple;
 
# SETUP
  												
# frame objects
my $fa;
my $fc;
# label objects
my $la;
my $lc;
# button objects
my $ba;
my $bc;
 
 
#-------------------------------------------------
# Convert
sub convert {
 
system("convert $url -resize 60x60 file.ppm");
system("convert file.ppm -compress none file.ppm");
 
}
 
#-------------------------------------------------
 
# GUI elements
# main window
my $mw = Tkx::widget->new(".");
$mw->g_wm_title("PPM Maker");
$mw->g_wm_minsize(350, 130);
 
# frame a
$fa = $mw->new_frame(
-relief => 'solid',
-borderwidth => 1,
-background => 'light gray',
);
$fa->g_pack( -side => 'top', -fill => 'both' );
 
$la = $fa->new_label(
-text => 'Choose File to Convert: ',
-bg => 'light gray',
-foreground => 'black',
);
$la->g_pack( -side => 'top', -fill => 'both' );
 
$lb = $fa->new_label(
-bg => 'blue',
-foreground => 'cyan',
-width => 24,
-textvariable => \$url,
);
$lb->g_pack( -side => 'top' );
 
$ba = $fa->new_button(
-text => 'Choose',
-command => sub { $url = Tkx::tk___getOpenFile();},
-height => 1,
-width => 15,
);
$ba->g_pack( -side => 'top', -pady => 5 );
 
 
# frame c
$fc = $mw->new_frame(
-relief => 'solid',
-borderwidth => 1,
-background => 'light gray',
);
$fc->g_pack( -side => 'top', -fill => 'both' );
 
$bc = $fc->new_button(
-text => 'CONVERT!',
-command => \&convert,
-height => 2,
-width => 15,
);
$bc->g_pack( -side => 'bottom', -pady => 10 );
 
 
Tkx::MainLoop();
