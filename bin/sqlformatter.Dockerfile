FROM frolvlad/alpine-python3
WORKDIR /app
RUN pip install sqlparse
ENTRYPOINT ["sqlformat", "--comma_first", "true", "--reindent", "--keywords", "upper", "--identifiers", "lower"]
