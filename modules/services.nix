{ ... }:

{
    services = {
        # CUPS
        printing.enable = true;
        # clipboard sharing with host for VMs
        spice-vdagentd.enable = true;
    };
}
