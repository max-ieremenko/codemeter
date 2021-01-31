FROM mcr.microsoft.com/dotnet/aspnet:5.0

LABEL maintainer=max-ieremenko

ADD codemeter_7.20.4396.500_amd64.deb Server.ini entrypoint.sh /app/

RUN apt-get update && \
    apt-get install -y -f /app/codemeter_7.20.4396.500_amd64.deb && \
	rm /app/codemeter_7.20.4396.500_amd64.deb && \
	mv /app/Server.ini /etc/wibu/CodeMeter/Server.ini && \
	bash -c "sed -i 's/\r//g' /app/entrypoint.sh /app/entrypoint.sh" && \
	chmod +x /app/entrypoint.sh

# 22350 communication between protected app and codemeter license server
# 22351 CmWANPort
# http://127.0.0.1:22352/dashboard.html
# https://127.0.0.1:22353/dashboard.html
EXPOSE 22350/tcp 22351/tcp 22352/tcp 22353/tcp
	
CMD /app/entrypoint.sh