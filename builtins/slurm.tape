submitter slurm :: COMMANDS 
                :: TASK REALIZATION CONFIGURATION {
    action run > exit_code {
        # Returns true iff the first parameter 
        # is the name of a defined variable
        function var_defined {
            eval '[[ ${!'$1'[@]} ]]'	     
        }

        # define script 
        wrapper="ducttape_job.sh"

        echo "#!/bin/bash" > $wrapper
        echo "set -e # stop on errors" >> $wrapper
        echo "set -o pipefail # stop on pipeline errors" >> $wrapper
        echo "set -u # stop on undeclared variables" >> $wrapper

        # print actual jobs 
        echo "$COMMANDS" >> $wrapper

        SLURM_ARGS="--job-name=$TASK"
        if (var_defined cpus); then
            SLURM_ARGS+=" -c $cpus"
        fi
        if (var_defined gres); then
            SLURM_ARGS+=" --gres=$gres"
        fi
        if (var_defined mem); then
            SLURM_ARGS+=" --mem=$mem"
        fi
        if (var_defined time); then
            SLURM_ARGS+=" --time=$time"
        fi
        if (var_defined nodelist); then
            SLURM_ARGS+=" --nodelist=$nodelist"
        fi
        if (var_defined exclude); then
            SLURM_ARGS+=" --exclude=$exclude"
        fi

        echo $SLURM_ARGS

        srun $SLURM_ARGS bash $wrapper
  }
}