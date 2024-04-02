qemu-system-x86_64 -m 4G -cpu host -enable-kvm -smp 4 -hdb ./shared.qcow2 -hda _dev-arch.qcow2 -device virtio-vga-gl -display sdl,gl=on -soundhw all
