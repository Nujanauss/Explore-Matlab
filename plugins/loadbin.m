function [EEG, com] = loadbin(filepath, varargin)
    com = '';

    fid = fopen(filepath);
    read = 1;
    ORN.data = [];
    ORN.timestamp = [];
    EEG.data = [];
    EEG.timestamp = [];
    ENV.temperature = [];
    ENV.light = [];
    ENV.battery = [];
    ENV.timestamp = [];
    TS = [];

    while read % Read file
        packet = parsePacket(fid);
        switch packet.type
            case 'orn'
                ORN.data = cat(2, ORN.data, packet.orn);
                ORN.timestamp = cat(2, ORN.timestamp, packet.timestamp);
            case {'eeg4', 'eeg8'}
                EEG.data = cat(2, EEG.data, packet.data);
                EEG.timestamp = cat(2,EEG.timestamp, repmat(packet.timestamp,...
                    1, size(packet.data, 2)));
            case 'env'
                ENV.temperature = cat(2, ENV.temperature, packet.temperature);
                ENV.light = cat(2, ENV.light, packet.light);
                ENV.battery = cat(2, ENV.battery, packet.battery);
                ENV.timestamp = cat(2, ENV.timestamp, packet.timestamp);
            case 'ts'
                TS = cat(2, TS, packet.ts);
            otherwise
                read = 0;   
        end
    end
end
