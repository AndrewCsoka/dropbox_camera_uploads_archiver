# Dropbox 'Camera Uploads' Archiver

If you use the Dropbox app on your mobile phone to automatically upload photos, you may have noticed they are all deposited into a single 'Camera Uploads' directory. After a while this becomes unwieldy: it's hard to find photos and the web app struggles to load the entire list. Personally, I don't sync this directory to my local machines, so this script uses the excellent rclone to remotely sort your photos into an archive directory by month.

## Getting Started

Once rclone is installed, configure a Dropbox remote with the name 'Dropbox' and grant it full access. See https://rclone.org/dropbox/

You may wish to edit the values in the config file however the defaults should be adequate.

```
START_DATE   Earliest date to archive from
ARCHIVE_DIR  New directory to contain monthly-sorted subdirectories
RETRIES      Maximum number of attempts to move the file
```

The script will run until the current month and is idempotent.

The resulting directory structure will be:

```
Dropbox
├── Camera Uploads
└── camera_uploads_archive
    ├── 2016-01
    ├── 2016-02
    ├── 2016-03
    └── 2016-04
```

## Authors

* **Andrew Csoka** - [AndrewCsoka](https://github.com/AndrewCsoka)

## License

This project is licensed under the GNU GPLv3 License - see the [LICENSE](LICENSE) file for details
