FROM node:6.6.0

# Install dependencies
RUN echo "# Upgrade apt" \
 && apt-get update \
 && echo "# Install common dev dependencies via apt" \
 && apt-get install -y wget build-essential \
 && echo "# Install wkhtmltopdf" \
 && wget --quiet http://download.gna.org/wkhtmltopdf/0.12/0.12.2.1/wkhtmltox-0.12.2.1_linux-jessie-amd64.deb \
 && dpkg-deb -x wkhtmltox-0.12.2.1_linux-jessie-amd64.deb . \
 && rm -rf wkhtmltox-0.12.2.1_linux-jessie-amd64.deb \
 && echo "# Clean" \
 && apt-get remove -y wget build-essential \
 && apt-get clean \
 && apt-get autoremove -y \
 && rm -rf /tmp/*
