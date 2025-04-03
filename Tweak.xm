#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

%hook NSObject

- (void)unlockBtnClick:(id)sender {
    NSLog(@"[FakePurchase] Hook no unlockBtnClick ativado — simulação de VIP!");

    // Tenta chamar updateVipStatus diretamente, se existir
    if ([self respondsToSelector:@selector(updateVipStatus)]) {
        NSLog(@"[FakePurchase] Chamando updateVipStatus manualmente");
        [self performSelector:@selector(updateVipStatus)];
    }

    // Evita que o método original seja executado (se necessário)
    // Ou apenas notifica
}

%end

%ctor {
    @autoreleasepool {
        NSLog(@"[FakePurchase] .dylib (versão VIP hook) carregada com sucesso");
    }
}
