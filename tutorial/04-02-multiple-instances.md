Running Multiple Instances (Processes) of Ducttape
==================================================

Ducttape supports running processs of itself for the same workflow and config.
It uses file-based locking to ensure that the processes don't touch the same
task at the same time. Ducttape ensures that these workflows will not deadlock
each other.

For example, if process A of the workflow starts running first,
and then process B starts running later, process B will only rerun any tasks
that were planned by process A iff they failed; otherwise, process B will
reuse the output generated by process B. If you desire to invalidate the
output of process A, you must first kill process A.

However, if there are 3 or more processs of ducttape running at the same time,
Ducttape does not guarantee which process will begin running the task first.
For example, say process A starts first, and processs B and C start later.
Then if some task T fails, either process B or process C will non-deterministically
take it over and begin running it.

For this reason, this functionality of having multiple processs is primarily
useful for 2 purposes:

* Adding additional realizations to the workflow's plan without modifying the workflow
* Fixing outright bugs in tasks that will definitely cause certain tasks to fail. This
  allows the second process to continue running these doomed tasks and their dependents
  to complete the workflow.