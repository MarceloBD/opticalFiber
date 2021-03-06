% Calculate the coefficient of aperiodicity for bragg networks 
% @param c, the coefficient of aperiodicity
% @param d, dispersion calculated (ps/(nm km))
% @param lambda, array of lambdas for which dispersion was previously calculated 
% @param length, distance traveled by wave in fiber in kilometers
function c = function_bragg_dispersion(d, lambda, length)
    dt = d .* length; 
    c = 1 ./ (dt .* Const.c0);
    c = c .* 10^12 ./ 10^2;
    
  
    
    figure
    plot(lambda, c, 'r','LineWidth',1.5); grid
    hLegend = legend('Coefficient of aperiodicity','location','northeast');
    set(hLegend,'FontSize',10); 
    title(['Coefficient of aperiodicity x wavelength']);
    xlabel('\lambda (\mum)')
    ylabel('C (nm/cm)')
end