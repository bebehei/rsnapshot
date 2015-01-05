# Developer Notes

This file is intended for developers and packagers of rsnapshot,
not for regular users of rsnapshot. If you want to contribute, it's a
good idea to read this document. Altough it is called contributing, it
describes the whole release and development process.

## Bug tracker

The bug tracker is hosted on [Github](https://github.com/DrHyde/rsnapshot/issues).

The mailing lists are still on the old [sourceforge-project](https://sourceforge.net/projects/rsnapshot/).

## Source code control

The rsnapshot source code is on [Github](https://github.com/DrHyde/rsnapshot).

The 'master' branch should be complete, by which we mean that there should
be no half-completed features in it. Any development-work should be done in a branch.

Branches should have only a single feature or bugfix in it. 

## Releases and versions

### release-branches

Releases should be done from branches, named for the release version,
e.g. release-1.4. The first release of that version should be tagged 'v1.4.0'.
Subsequent releases of that version, which should contain no changes other
than bugfixes and security fixes, should also be tagged as, eg, 'v1.4.1'.
*Mind, that the tags have a leading 'v'.*

//unsure, depends on further development
Depending on the activity of rsnapshot, for every merged bugfix-branch, a bugfix-release should be done.

### release-model in practice
Here is a model presented for release 1.4.0. Make sure, that you start
on the master-branch and have a clean working-directory!

1.  You start branching out of the master-branch

    git checkout -b release-1-4

2.  If there are necessary changes to do before release, make them and commit them now.

    git add -A
    git commit -m "Finish Release v1.4.0"

3.  tag the commit with git and push it to repo

    git tag v1.4.0
    git push --tags
 
4.  Now generate the configure-file with autogen.sh and make the release-tarball

    ./autogen.sh
    make dist

5.  Now upload the tarball to the github-page for the specific version.

## Building rsnapshot 

rsnapshot uses the common and widespread triple to build the software

    $ ./configure
    $ make
    $ make install

If there is no configure-script, you have to generate it with:

    $ ./ autogen.sh

### make targets

* *make man*: generate the man page from POD data in rsnapshot
* *make html*: generate a HTML page from POD data in rsnapshot
* *make doc*: man + html
* *make test*: run the testsuite
* *make clean*: clean up the mess from autoconf
* *make dist*: make the release-tarball
* *make rpm*:

To create the RPM (on a RedHat compatible system, I usually used
CentOS). beware, RPMs are not necessarily compatible between distros!
rsnapshot is simple enough that the RPMs seem to work everywhere
(partly thanks to a bug reported by a SuSE user where needless RPM
dependencies were being introduced). If all goes well, you should end
up with an RPM in your working directory. see the rpm Makefile target
for details on the commands.

    tar xzvf rsnapshot-x.y.z.tar.gz
    cd rsnapshot-x.y.z
    ./configure
    make rpm
    or
    make RPM_BASE_DIR=/path/to/rpmbuild rpm
