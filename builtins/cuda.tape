# a simple modification of the shell submitter
# that exports the CUDA_VISIBLE_DEVICES based on the THREAD_ID
submitter cuda_shell :: COMMANDS THREAD_ID {
  action run {
    export CUDA_VISIBLE_DEVICES=$THREAD_ID
    eval "$COMMANDS"
  }
}