#!/usr/bin/env python3

import config
import db.connect


def main():
    cfg = config.new_config()
    db_conn = db.connect.new_connection(cfg)
    db_conn.close()


if __name__ == '__main__':
    main()
