
use strict;
use warnings;

use 5.012;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Declare methods requirements that must be satisfied",
  "AUTHOR" => "Chris Weyl <cweyl\@alumni.drew.edu>",
  "BUILD_REQUIRES" => {
    "Carp" => 0,
    "File::Find" => 0,
    "File::Temp" => 0,
    "Scalar::Util" => 0,
    "Test::Fatal" => 0,
    "Test::Moose" => 0,
    "Test::More" => "0.94",
    "Test::UseAllModules" => 0,
    "constant" => 0,
    "perl" => "5.004",
    "strict" => 0,
    "warnings" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "MooseX-AbstractMethod",
  "EXE_FILES" => [],
  "LICENSE" => "lgpl",
  "NAME" => "MooseX::AbstractMethod",
  "PREREQ_PM" => {
    "Moose" => "0.94",
    "Moose::Exporter" => 0,
    "Moose::Role" => 0,
    "Moose::Util" => 0,
    "Moose::Util::MetaRole" => 0,
    "namespace::autoclean" => 0
  },
  "VERSION" => "0.001",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



