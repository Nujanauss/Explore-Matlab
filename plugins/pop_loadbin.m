function [EEG, com] = pop_loadbin(filepath, varargin)  
    com = '';
    if nargin < 1 % No file provided
        [filename, path] = uigetfile({'*.BIN;' 'All BIN files';}, 'Select a BIN file'); 
        if filename == 0
            error('File selection cancelled.')
        else
            filepath = strcat(path,filename);
            loadbin(filepath);
        end
    else % file was specified in the call
        loadbin(filepath);
    end
        
end
