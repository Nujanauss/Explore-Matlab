function [EEG, command] = pop_loadbin(fullfilename, varargin)  
    command = '';
    if nargin < 1 % No file provided
        [filename, filepath] = uigetfile({'*.bin;' 'All BIN files';}, 'Select a BIN file'); 
        drawnow;
        if filename == 0 % the user aborted
            error('pop_loadbin(): File selection cancelled. Error thrown to avoid overwriting data in EEG.')
        else % The user selected something
            % Get filename components
            fullfilename = [filepath, filename];
            load(fullfilename);
        end
    else % file was specified in the call
        load(fullfilename);
    end
        
end

function [EEG, command] = load(fullfilename)
    EEG = [];
    EEG = eeg_emptyset;
    [EEG, command] = loadbin(fullfilename);
end
