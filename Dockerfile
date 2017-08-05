# The `FROM` instruction specifies the base image. You are
# extending the `microsoft/iis` image.
FROM microsoft/iis

# Create a directory to hold the web app in the container.
RUN mkdir C:\site

# Create a new IIS site.
RUN powershell -NoProfile -Command \
    Import-module IISAdministration; \
    New-IISSite -Name "Site" -PhysicalPath C:\site -BindingInformation "*:8000:"

# Opens port 8000 on the container.
EXPOSE 8000

# The final instruction copies the web app you created earlier into the container.
ADD Content/ /site