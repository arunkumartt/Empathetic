# Generated by Django 4.2.5 on 2023-12-18 11:17

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0002_organization_organizationtype_organizationstories_and_more'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='organizationtype',
            name='created_at',
        ),
    ]