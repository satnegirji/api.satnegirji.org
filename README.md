# api.satnegirji.org

The job of this service is to provide a read-only API for searching keywords and showing all translations of a specific word.

The database will be constantly rewritten, the master data comes from another database. The database of this service is read-only, so no need for advanced model validations.

Anything that makes searching fast is important, such as indexes in tables.

This service will always make a happy-case assumption that the read-only database is correct and contains only valid data.
