function [EEG, com] = pop_loadbin(filepath, varargin)  
    com = '';
    if nargin > 0  % File provided in call
        loadbin(filepath);
        return;
    end

    [filename, path] = uigetfile({'*.BIN;' 'All BIN files';}, 'Select a BIN file'); 
    if filename == 0
        error('File selection cancelled.')
    else
        filepath = strcat(path, filename);
        loadbin(filepath);
    end
end
