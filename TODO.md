TODO
====

- Enable the filtering feature(s) (regex) for specific BOSH jobs/indices.
   * bosh_deployment | deployment
   * bosh_job_name   | job_name
   * bosh_job_index  | job_index
- Support `--include` / `-i`  and `--exclude` / `-x` instead of
  `--filter`, to have more granular control over the log stream
- Implement a heartbeat logger server-side, and be able to detect
  when we are actually losing data from Sawmill, vs. not having
  anything useful to say.
- Implement a `--debug` / `-D` flag for printing out additional
  debugging
- Implement a `--trace` / `-T` flag that turns on `-D` but also
  enables HTTP-level request/response debugging (hardcore!)
- Implement a `--count` / `-c` flag that will stop spewing log
  data after that many messages have been seen (that pass the
  filter), similar to tcpdump's `-c` option.
- Parse the syslog message into consituent pieces (i.e. priority,
  timestamp, etc.) for use in filtering
- Provide a new flag (like `--detailed`) that prints a more
  detailed per-message breakout, with keys for things like
  priority / severity / etc.
- Provide a new flag (like `--yaml`) that takes the `--detailed`
  output and formats it as valid YAML, for great jq-iness!
