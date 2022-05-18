from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('store', '0005_create_index'),
    ]

    operations = [
        migrations.RunSQL(
            '''
            insert into public.store_collection (title)
                values ('collection1');
            ''',
            '''
            delete from public.store_collection
                where title = 'collection1';
            ''')
    ]
