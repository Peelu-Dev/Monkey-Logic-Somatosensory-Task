eventmarker(1);    % TrialStart_
Increment=5;
%showcursor('on');
COND=TrialRecord.CurrentCondition;
if TrialRecord.CurrentTrialNumber == 1
  TrialRecord.User.TOT_trl=0;
  TrialRecord.User.prev_TOT_trl=0;
else 
  TrialRecord.User.prev_TOT_trl=TrialRecord.User.TOT_trl;
end

stimulus=1; %right target
fixation_point= 2;
Feedback_1 = 3;
Feedback_2 = 4;
Feedback_3 = 5;
Feedback_4 = 6;
Feedback_5 = 7;
Feedback_6 = 8;
Feedback_7 = 9;
Feedback_8 = 10;
Feedback_9 = 11;
ready = 12;






% Define timing for the fixation cue
acq_fix = 300;
hold_fix_avg = 500;
hold_fix_jitter = 0.10;
hold_fix = randi([hold_fix_avg-(hold_fix_jitter*hold_fix_avg),hold_fix_avg+(hold_fix_jitter*hold_fix_avg)],1,1);




max_reaction_time = 300000

max_reaction_time2 = 1000;


% Define timing for cue 
hold_cue_avg=5000;
hold_cue_jitter=0.05;
hold_cue = randi([hold_cue_avg-(hold_cue_jitter*hold_cue_avg),hold_cue_avg+(hold_cue_jitter*hold_cue_avg)],1,1);



fix_radius= 3 ;%1.25;
targ_radius=5;


% Store these variables in behavior variables
bhv_variable('acq_fix_time',acq_fix);bhv_variable('hold_fix_avg',hold_fix_avg);bhv_variable('hold_fix_jitter',hold_fix_jitter);bhv_variable('hold_fix',hold_fix);
bhv_variable('hold_cue_avg',hold_cue_avg);bhv_variable('hold_cue',hold_cue);
bhv_variable('fix_radius',fix_radius);bhv_variable('targ_radius',targ_radius);

% DS8R Setup Function for low intensity electrical stimulation
function trigger_shock_low()
    [success, d128] = D128ctrl('open');
    [success, d128] = D128ctrl('status', d128);
    [success, d128] = D128ctrl('enable', d128, 0);
    [success, d128] = D128ctrl('source', d128, 'Internal');



    [success, d128] = D128ctrl('pulsewidth', d128, 100);
    [success, d128] = D128ctrl('demand', d128, 10);




    [success, d128] = D128ctrl('dwell', d128, 400);
    success = D128ctrl('upload', d128);
    [success, d128] = D128ctrl('enable', d128, 1);
    success = D128ctrl('Trigger', d128);
    [success, d128] = D128ctrl('status', d128);
    success = D128ctrl('close', d128);
end

function trigger_shock_high()
    [success, d128] = D128ctrl('open');
    [success, d128] = D128ctrl('status', d128);
    [success, d128] = D128ctrl('enable', d128, 0);
    [success, d128] = D128ctrl('source', d128, 'Internal');



    [success, d128] = D128ctrl('pulsewidth', d128, 100);
    [success, d128] = D128ctrl('demand', d128, 20);


    
    [success, d128] = D128ctrl('dwell', d128, 400);
    success = D128ctrl('upload', d128);
    [success, d128] = D128ctrl('enable', d128, 1);
    success = D128ctrl('Trigger', d128);
    [success, d128] = D128ctrl('status', d128);
    success = D128ctrl('close', d128);
end


TOT_time = 0;
last_shock_time = 0;
shock_interval = 0.5; % 500ms between shocks
shock_count = 0;

% TASK: %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
resp_=nan;
% initial fixation
toggleobject(ready,'Status', 'on');
idle(500)
toggleobject(ready,'Status', 'off');

[scancode1,rt1] = getkeypress(max_reaction_time)

if scancode1 == 200
   eventmarker(2) % Starting cue presentation
   toggleobject(stimulus,'Status', 'on');
else 
   ABORT=1;
   trialerror(1)
   TrialRecord.User.TOT_trl=TrialRecord.User.prev_TOT_trl; %Trial not counted for incorrect response
   return
end
Pressing = true;
RTS = [];
start_time = trialtime(); % Record the starting time of the stimulus presentation
while Pressing && (trialtime() - start_time) <= 20000 % 20 seconds limit
    [scancode2,rt2] = getkeypress(max_reaction_time2);
    Pressing = (rt2 <= 750);
    RTS = [RTS; rt2];
%end
%while Pressing
    tEnd = toc;
    TOT_time = TOT_time + tEnd;
    
    % Check if it's time for next shock
    if (TOT_time - last_shock_time) >= shock_interval
        % Deliver shock based on condition
        if TrialRecord.CurrentCondition == 1
            trigger_shock_low();
            disp(['Low shock ', num2str(shock_count + 1), ' at time:', num2str(TOT_time)]);
        elseif TrialRecord.CurrentCondition == 2
            trigger_shock_low();
            disp(['Low shock ', num2str(shock_count + 1), ' at time:', num2str(TOT_time)]);
        elseif TrialRecord.CurrentCondition == 3
            trigger_shock_low();
            disp(['Low shock ', num2str(shock_count + 1), ' at time:', num2str(TOT_time)]);
        elseif TrialRecord.CurrentCondition == 4
            trigger_shock_low();
            disp(['Low shock ', num2str(shock_count + 1), ' at time:', num2str(TOT_time)]);
        elseif TrialRecord.CurrentCondition == 5
            trigger_shock_low();
            disp(['Low shock ', num2str(shock_count + 1), ' at time:', num2str(TOT_time)]);
        elseif TrialRecord.CurrentCondition == 6
            trigger_shock_low();
            disp(['Low shock ', num2str(shock_count + 1), ' at time:', num2str(TOT_time)]);
        elseif TrialRecord.CurrentCondition == 7
            trigger_shock_low();
            disp(['Low shock ', num2str(shock_count + 1), ' at time:', num2str(TOT_time)]);
        elseif TrialRecord.CurrentCondition == 8
            trigger_shock_low();
            disp(['Low shock ', num2str(shock_count + 1), ' at time:', num2str(TOT_time)]);
        elseif TrialRecord.CurrentCondition == 9
            trigger_shock_low();
            disp(['Low shock ', num2str(shock_count + 1), ' at time:', num2str(TOT_time)]);
        elseif TrialRecord.CurrentCondition == 10
            trigger_shock_low();
            disp(['Low shock ', num2str(shock_count + 1), ' at time:', num2str(TOT_time)]);
        elseif TrialRecord.CurrentCondition == 11
            trigger_shock_high();
            disp(['High shock ', num2str(shock_count + 1), ' at time:', num2str(TOT_time)]);
        elseif TrialRecord.CurrentCondition == 12
            trigger_shock_high();
            disp(['High shock ', num2str(shock_count + 1), ' at time:', num2str(TOT_time)]);
        elseif TrialRecord.CurrentCondition == 13
            trigger_shock_high();
            disp(['High shock ', num2str(shock_count + 1), ' at time:', num2str(TOT_time)]);
        elseif TrialRecord.CurrentCondition == 14
            trigger_shock_high();
            disp(['High shock ', num2str(shock_count + 1), ' at time:', num2str(TOT_time)]);
        elseif TrialRecord.CurrentCondition == 15
            trigger_shock_high();
            disp(['High shock ', num2str(shock_count + 1), ' at time:', num2str(TOT_time)]);
        elseif TrialRecord.CurrentCondition == 16
            trigger_shock_high();
            disp(['High shock ', num2str(shock_count + 1), ' at time:', num2str(TOT_time)]);
        elseif TrialRecord.CurrentCondition == 17
            trigger_shock_high();
            disp(['High shock ', num2str(shock_count + 1), ' at time:', num2str(TOT_time)]);
        elseif TrialRecord.CurrentCondition == 18
            trigger_shock_high();
            disp(['High shock ', num2str(shock_count + 1), ' at time:', num2str(TOT_time)]);
        elseif TrialRecord.CurrentCondition == 19
            trigger_shock_high();
            disp(['High shock ', num2str(shock_count + 1), ' at time:', num2str(TOT_time)]);
        elseif TrialRecord.CurrentCondition == 20
            trigger_shock_high();
            disp(['High shock ', num2str(shock_count + 1), ' at time:', num2str(TOT_time)]);
        elseif TrialRecord.CurrentCondition == 21
            trigger_shock_low();
            disp(['Low shock ', num2str(shock_count + 1), ' at time:', num2str(TOT_time)]);
        elseif TrialRecord.CurrentCondition == 22
            trigger_shock_low();
            disp(['High shock ', num2str(shock_count + 1), ' at time:', num2str(TOT_time)]);
        elseif TrialRecord.CurrentCondition == 23
            trigger_shock_low();
            disp(['Low shock', num2str(shock_count + 1), ' at time:', num2str(TOT_time)]);
        elseif TrialRecord.CurrentCondition == 24
            trigger_shock_low();
            disp(['Low shock', num2str(shock_count + 1), ' at time:', num2str(TOT_time)]);
        elseif TrialRecord.CurrentCondition == 25
            trigger_shock_low();
            disp(['Low shock', num2str(shock_count + 1), ' at time:', num2str(TOT_time)]);
        elseif TrialRecord.CurrentCondition == 26
             trigger_shock_low();
            disp(['Low shock', num2str(shock_count + 1), ' at time:', num2str(TOT_time)]);
        elseif TrialRecord.CurrentCondition == 27
            trigger_shock_low();
            disp(['Low shock ', num2str(shock_count + 1), ' at time:', num2str(TOT_time)]);
        elseif TrialRecord.CurrentCondition == 28
            trigger_shock_low();
            disp(['Low shock ', num2str(shock_count + 1), ' at time:', num2str(TOT_time)]);
        elseif TrialRecord.CurrentCondition == 29
            trigger_shock_low();
            disp(['Low shock ', num2str(shock_count + 1), ' at time:', num2str(TOT_time)]);
        elseif TrialRecord.CurrentCondition == 30
            trigger_shock_low();
            disp(['Low shock ', num2str(shock_count + 1), ' at time:', num2str(TOT_time)]);
        elseif TrialRecord.CurrentCondition == 31
            trigger_shock_high();
            disp(['High shock ', num2str(shock_count + 1), ' at time:', num2str(TOT_time)]);
        elseif TrialRecord.CurrentCondition == 32
            trigger_shock_high();
            disp(['High shock ', num2str(shock_count + 1), ' at time:', num2str(TOT_time)]);
        elseif TrialRecord.CurrentCondition == 33
            trigger_shock_high();
            disp(['High shock ', num2str(shock_count + 1), ' at time:', num2str(TOT_time)]);
        elseif TrialRecord.CurrentCondition == 34
            trigger_shock_high();
            disp(['High shock ', num2str(shock_count + 1), ' at time:', num2str(TOT_time)]);
        elseif TrialRecord.CurrentCondition == 35
            trigger_shock_high();
            disp(['High shock ', num2str(shock_count + 1), ' at time:', num2str(TOT_time)]);
        elseif TrialRecord.CurrentCondition == 36
            trigger_shock_high();
            disp(['High shock ', num2str(shock_count + 1), ' at time:', num2str(TOT_time)]);
        elseif TrialRecord.CurrentCondition == 37
            trigger_shock_high();
            disp(['High shock ', num2str(shock_count + 1), ' at time:', num2str(TOT_time)]);
        elseif TrialRecord.CurrentCondition == 38
            trigger_shock_high();
            disp(['High shock ', num2str(shock_count + 1), ' at time:', num2str(TOT_time)]);
        elseif TrialRecord.CurrentCondition == 39
            trigger_shock_high();
            disp(['High shock ', num2str(shock_count + 1), ' at time:', num2str(TOT_time)]);
        elseif TrialRecord.CurrentCondition == 40
            trigger_shock_high();
            disp(['High shock ', num2str(shock_count + 1), ' at time:', num2str(TOT_time)]);
            elseif TrialRecord.CurrentCondition == 41
            trigger_shock_low();
            disp(['Low shock ', num2str(shock_count + 1), ' at time:', num2str(TOT_time)]);
        elseif TrialRecord.CurrentCondition == 42
            trigger_shock_low();
            disp(['High shock ', num2str(shock_count + 1), ' at time:', num2str(TOT_time)]);
        elseif TrialRecord.CurrentCondition == 43
            trigger_shock_low();
            disp(['Low shock', num2str(shock_count + 1), ' at time:', num2str(TOT_time)]);
        elseif TrialRecord.CurrentCondition == 44
            trigger_shock_low();
            disp(['Low shock', num2str(shock_count + 1), ' at time:', num2str(TOT_time)]);
        elseif TrialRecord.CurrentCondition == 45
            trigger_shock_low();
            disp(['Low shock', num2str(shock_count + 1), ' at time:', num2str(TOT_time)]);
        elseif TrialRecord.CurrentCondition == 46
             trigger_shock_low();
            disp(['Low shock', num2str(shock_count + 1), ' at time:', num2str(TOT_time)]);
        elseif TrialRecord.CurrentCondition == 47
            trigger_shock_low();
            disp(['Low shock ', num2str(shock_count + 1), ' at time:', num2str(TOT_time)]);
        elseif TrialRecord.CurrentCondition == 48
            trigger_shock_low();
            disp(['Low shock ', num2str(shock_count + 1), ' at time:', num2str(TOT_time)]);
        elseif TrialRecord.CurrentCondition == 49
            trigger_shock_low();
            disp(['Low shock ', num2str(shock_count + 1), ' at time:', num2str(TOT_time)]);
        elseif TrialRecord.CurrentCondition == 50
            trigger_shock_low();
            disp(['Low shock ', num2str(shock_count + 1), ' at time:', num2str(TOT_time)]);
         elseif TrialRecord.CurrentCondition == 51
            trigger_shock_high();
            disp(['High shock ', num2str(shock_count + 1), ' at time:', num2str(TOT_time)]);
        elseif TrialRecord.CurrentCondition == 52
            trigger_shock_high();
            disp(['High shock ', num2str(shock_count + 1), ' at time:', num2str(TOT_time)]);
        elseif TrialRecord.CurrentCondition == 53
            trigger_shock_high();
            disp(['High shock ', num2str(shock_count + 1), ' at time:', num2str(TOT_time)]);
        elseif TrialRecord.CurrentCondition == 54
            trigger_shock_high();
            disp(['High shock ', num2str(shock_count + 1), ' at time:', num2str(TOT_time)]);
        elseif TrialRecord.CurrentCondition == 55
            trigger_shock_high();
            disp(['High shock ', num2str(shock_count + 1), ' at time:', num2str(TOT_time)]);
        elseif TrialRecord.CurrentCondition == 56
            trigger_shock_high();
            disp(['High shock ', num2str(shock_count + 1), ' at time:', num2str(TOT_time)]);
        elseif TrialRecord.CurrentCondition == 57
            trigger_shock_high();
            disp(['High shock ', num2str(shock_count + 1), ' at time:', num2str(TOT_time)]);
        elseif TrialRecord.CurrentCondition == 58
            trigger_shock_high();
            disp(['High shock ', num2str(shock_count + 1), ' at time:', num2str(TOT_time)]);
        elseif TrialRecord.CurrentCondition == 59
            trigger_shock_high();
            disp(['High shock ', num2str(shock_count + 1), ' at time:', num2str(TOT_time)]);
        elseif TrialRecord.CurrentCondition == 60
            trigger_shock_high();
            disp(['High shock ', num2str(shock_count + 1), ' at time:', num2str(TOT_time)]);
        end
        last_shock_time = TOT_time;
        shock_count = shock_count + 1;
        bhv_variable('total_shocks_delivered', shock_count);
    end
    [scancode2,rt2] = getkeypress(max_reaction_time2);
    Pressing = (rt2<=500);
    RTS = [RTS;rt2];
end



eventmarker(3) % Ending cue presentation
toggleobject(stimulus,'Status', 'off');




bhv_variable('durations',RTS)

TrialRecord.User.TOT_trl=TrialRecord.User.prev_TOT_trl + 1; 

% Modified escape condition
if TrialRecord.CurrentTrialNumber == 30 || TrialRecord.CurrentTrialNumber >= 60
    escape_screen;
end





% DS8R Setup Function for high intensity electrical stimulation



