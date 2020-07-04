FROM frolvlad/alpine-python3
WORKDIR /app
RUN pip install sqlparse
ENTRYPOINT ["sqlformat", "--reindent", "--keywords", "upper", "--identifiers", "lower"]
