qemu-system-x86_64 -m 5G -cpu host -enable-kvm -smp 4 -hda ./_winxp.qcow2 -soundhw all -device virtio-vga-gl -display sdl,gl=on -nic none
