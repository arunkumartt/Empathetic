from django import forms
from .models import Organization_multi_image




class MultipleImageUploadForm(forms.ModelForm):
    

    class Meta:
        model = Organization_multi_image
        fields = ['image']
