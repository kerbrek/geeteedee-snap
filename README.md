# GeeTeeDee snap

GeeTeeDee is a lightweight and easy to use task management software. It keeps everything simple to let you stay focused on what is really important - getting things done.

Project homepage: https://codea.ru/gtd/


## Prerequisites

* snapcraft (required to build snap; [documentation](https://snapcraft.io/docs))

    `sudo snap install snapcraft --classic`

* make (required to run make commands defined in [Makefile](https://github.com/kerbrek/geeteedee-snap/blob/main/Makefile))

    `sudo apt -y install make`

* curl, dpkg, sed (required to download and fix deb file)

    `sudo apt -y install curl dpkg sed`


## Commands

* Dowload deb file and fix it

    `make prepare`

* Build snap

    `make build`

* Install builded snap

    `make install`

* Run installed snap

    `make run`

* Remove installed snap

    `make remove`

* Remove files generated during build stage (can take up 10 gigabytes)

    `make clean`


## Alternatives

* [Planner](https://planner-todo.web.app/)
* [GNOME To Do](https://wiki.gnome.org/Apps/Todo)
