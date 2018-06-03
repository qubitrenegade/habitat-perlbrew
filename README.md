# Habitat package: perlbrew

## Description

Binary package to install fatpacked perbrew "pseudobinary".  (Not actually a binary, but includes all perl libs, it's [this file](https://github.com/gugod/App-perlbrew/blob/develop/perlbrew))

Apparently my Perl is a bit rusty since I thought [Module::Build](http://search.cpan.org/~leont/Module-Build-0.4224/lib/Module/Build.pm) made standard make files...  Anyway, it may be worth building this package from source...

```
  perl Build.PL
  ./Build
  ./Build test
  ./Build install
```

## Usage

I _think_ you can just include `qubitrenegade/perlbrew` as a pkg_build_dep then in your build phase do a:

```
PERLBREW_ROOT=${pkg_prefix}
perlbrew install 5.22.5
```
