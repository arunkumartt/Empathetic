# Generated by Django 4.2.7 on 2024-01-23 10:48

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0009_donormap'),
    ]

    operations = [
        migrations.CreateModel(
            name='Organization_multi_image',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('image', models.ImageField(blank=True, null=True, upload_to='Organization_multi_image')),
                ('created_at', models.TimeField(auto_now_add=True)),
                ('organization', models.ForeignKey(default=None, null=True, on_delete=django.db.models.deletion.CASCADE, to='app.organization')),
            ],
        ),
    ]