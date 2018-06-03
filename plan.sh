pkg_name=perlbrew
pkg_origin=qubitrenegade
pkg_version="0.83"
pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
pkg_license=("MPL-2.0")
pkg_source="https://github.com/gugod/App-perlbrew/archive/release-${pkg_version}.tar.gz"
pkg_filename="${pkg_name}-${pkg_version}.tar.gz"
pkg_shasum="dfb9c63be22fb75b4a7f19f4c55ae3d2bee02c4b95c1d09d4e549ec4c6d1556f"
pkg_deps=(core/glibc core/perl core/wget)
pkg_build_deps=()
pkg_lib_dirs=(lib)
pkg_include_dirs=(include)
pkg_bin_dirs=(bin)
pkg_interpreters=(bin/perl)
pkg_description="perlbrew for Habitat.  https://github.com/qubitrenegade/habitat-perlbrew"
pkg_upstream_url="https://github.com/gugod/App-perlbrew"

# Callback Functions
#
# When defining your plan, you have the flexibility to override the default
# behavior of Habitat in each part of the package building stage through a
# series of callbacks. To define a callback, simply create a shell function
# of the same name in your plan.sh file and then write your script. If you do
# not want to use the default callback behavior, you must override the callback
# and return 0 in the function definition.
#
# Callbacks are defined here with either their "do_default_x", if they have a
# default implementation, or empty with "return 0" if they have no default
# implementation (Bash does not allow empty function bodies.) If callbacks do
# nothing or do the same as the default implementation, they can be removed from
# this template.
#
# The default implementations (the do_default_* functions) are defined in the
# plan build script:
# https://github.com/habitat-sh/habitat/tree/master/components/plan-build/bin/hab-plan-build.sh

do_build() {
  fix_interpreter ${HAB_CACHE_SRC_PATH}/App-perlbrew-release-${pkg_version}/perlbrew core/perl bin/perl
}

do_install() {
  install -D ${HAB_CACHE_SRC_PATH}/App-perlbrew-release-${pkg_version}/${pkg_name} "${pkg_prefix}/bin/${pkg_name}" 
}

do_strip() { 
 return 0 
}
