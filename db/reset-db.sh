echo 'SET client_min_messages TO WARNING;' >  /tmp/reset_bb_dev.sql

psql -q -h localhost -U developer -d bb_dev -c "SELECT table_schema,table_name 
    FROM information_schema.tables
    WHERE table_catalog = 'bb_dev' AND
        table_schema != 'information_schema' AND
        table_schema != 'pg_catalog' AND
        table_schema != 'referencedata' AND
        table_type = 'BASE TABLE'
    ORDER BY table_schema,table_name;" | tail -n +3 | head -n -2 | tr -d ' '  | cut -d'|' -f1,2 --output-delimiter ',' \
        | sed -rn 's/([a-z]+)\,([a-z_]+)/set search_path=\1; truncate \2 cascade;/p' \
        >> /tmp/reset_bb_dev.sql

echo "drop sequence badgemanagement.badge_no;" >> /tmp/reset_bb_dev.sql
echo "CREATE SEQUENCE badgemanagement.badge_no INCREMENT -1 START WITH 63999999 MAXVALUE 63999999;" >> /tmp/reset_bb_dev.sql

psql -q -h localhost -U developer -d bb_dev -f /tmp/reset_bb_dev.sql
