use strict;
use Template::Test;

my $vars = {
    employee_info => [
	{ name => 'Sam', job => 'programmer' },
	{ name => 'Steve', job => 'soda jerk' },
    ],
};

test_expect(\*DATA, undef, $vars);

__END__
--test--
[% USE HTML.Template -%]
[% FILTER html_template -%]
<TMPL_LOOP NAME=EMPLOYEE_INFO>  Name: <TMPL_VAR NAME=NAME> <br>
  Job:  <TMPL_VAR NAME=JOB>  <p>
</TMPL_LOOP>
[%- END %]
--expect--
  Name: Sam <br>
  Job:  programmer  <p>
  Name: Steve <br>
  Job:  soda jerk  <p>

